const db = require('../data/db-config')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db('schemes')
}

function findById(id){
    return db('schemes').where({id}).first()
        // .then(scheme => {
        //     if(scheme[0]){
        //         return scheme
        //     }else{
        //         return null
        //     }
        // })
}

function findSteps(id){
    return db('steps')
    .join('schemes', 'steps.scheme_id', 'schemes.id')
    .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
    .where('schemes.id', '=', id)
}

function add(schemeData){
    return db('schemes')
        .insert(schemeData)
        .then(([id]) => {
            return findById(id)
        })
}

function update(schemeUpdatedData, id){
    return db('schemes')
        .where({id})
        .update(schemeUpdatedData)
        .then(() => {
            return findById(id)
        })
}

function remove(id){
    return db('schemes')
        .where({id})
        .del()
}
