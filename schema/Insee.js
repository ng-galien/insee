cube('Insee', {
  sql: 'SELECT * FROM public.insee',
  
  joins: {
    States: {
      relationship: 'hasOne',
      sql: '${Insee}.death_state = ${States}.id'
    }
  },
  
  measures: {
    count: {
      type: 'count',
      drillMembers: [id, deathDate, birthDate],
      title: "Total"
    },
    deathPop1: {
      sql: 'sum(${Insee.deathCat1})',
      type: 'number',
      //format: 'percent',
      drillMembers: [id, deathDate],
      title: "Total 0-19 ans"
    },
    deathPop2: {
      sql: 'sum(${Insee.deathCat2})',
      type: 'number',
      //format: 'percent',
      drillMembers: [id, deathDate],
      title: "Total 20-39 ans"
    },
    deathPop3: {
      sql: 'sum(${Insee.deathCat3})',
      type: 'number',
      //format: 'percent',
      drillMembers: [id, deathDate],
      title: "Total 40-59 ans"
    },
    deathPop4: {
      sql: 'sum(${Insee.deathCat4})',
      type: 'number',
      //format: 'percent',
      drillMembers: [id, deathDate],
      title: "Total 60-74 ans"
    },
    deathPop5: {
      sql: 'sum(${Insee.deathCat5})',
      type: 'number',
      //format: 'percent',
      drillMembers: [id, deathDate],
      title: "Total +75 ans"
    }
  },
  dimensions: {
    id: {
      sql: 'id',
      type: 'number',
      primaryKey: true
    },
    deathDate: {
      sql: 'death_date',
      type: 'time'
    },
    
    birthDate: {
      sql: 'birth_date',
      type: 'time'
    },
    deathCat1: {
      sql: 'age_cat_1',
      type: 'number'
    },
    deathCat2: {
      sql: 'age_cat_2',
      type: 'number'
    },
    deathCat3: {
      sql: 'age_cat_3',
      type: 'number'
    },
    deathCat4: {
      sql: 'age_cat_4',
      type: 'number'
    },
    deathCat5: {
      sql: 'age_cat_5',
      type: 'number'
    },

    sex: {
      sql: 'sex',
      type: 'string'
    },
    location: {
      sql: 'location',
      type: 'string'
    }

  }
});
