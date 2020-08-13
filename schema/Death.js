cube(`Deaths`, {
  sql: `SELECT * FROM public.death`,
  
  joins: {
    States: {
      relationship: `belongsTo`,
      sql: `${Deaths}.death_state_id = ${States}.id`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, deathDate, birthDate],
      title: "Total"
    },
    deathPop: {
      sql: `trunc(count(*) / avg(${States.popTot}) * 1000.0, 5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate, birthDate],
      title: "Ratio Total"
    },
    deathRatioPop1: {
      sql: `trunc(sum(${Deaths.deathCat1}) / avg(${States.popCat1}) * 10000.0, 5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Ratio 0-19 ans"
    },
    deathRatioPop2: {
      sql: `trunc(sum(${Deaths.deathCat2}) / avg(${States.popCat2}) * 10000.0,5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Ratio 20-39 ans"
    },
    deathRatioPop3: {
      sql: `trunc(sum(${Deaths.deathCat3}) / avg(${States.popCat3}) * 10000.0,5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Ratio 40-59 ans"
    },
    deathRatioPop4: {
      sql: `trunc(sum(${Deaths.deathCat4}) / avg(${States.popCat4}) * 10000.0,5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Ratio 60-74 ans"
    },
    deathRatioPop5: {
      sql: `trunc(sum(${Deaths.deathCat5}) / avg(${States.popCat5}) * 10000.0,5)`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Ratio +75 ans"
    },
    deathPop1: {
      sql: `sum(${Deaths.deathCat1})`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Total 0-19 ans"
    },
    deathPop2: {
      sql: `sum(${Deaths.deathCat2})`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Total 20-39 ans"
    },
    deathPop3: {
      sql: `sum(${Deaths.deathCat3})`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Total 40-59 ans"
    },
    deathPop4: {
      sql: `sum(${Deaths.deathCat4})`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Total 60-74 ans"
    },
    deathPop5: {
      sql: `sum(${Deaths.deathCat5})`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate],
      title: "Total +75 ans"
    },
    deathDiab: {
      sql: `count(*) / avg(${States.diab}) * 10000.0`,
      type: `number`,
      //format: `percent`,
      drillMembers: [id, deathDate, birthDate],
      title: "Ratio Diabète"
    }
  },
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    deathLocalization: {
      sql: `death_localization`,
      type: `string`
    },
    
    deathCat1: {
      sql: `death_cat_1`,
      type: `number`
    },
    deathCat2: {
      sql: `death_cat_2`,
      type: `number`
    },
    deathCat3: {
      sql: `death_cat_3`,
      type: `number`
    },
    deathCat4: {
      sql: `death_cat_4`,
      type: `number`
    },
    deathCat5: {
      sql: `death_cat_5`,
      type: `number`
    },

    sex: {
      sql: `sex`,
      type: `string`
    },
    
    regionGroup: {
      sql: `region_group`,
      type: `string`
    },
    
    deathCity: {
      sql: `death_city`,
      type: `string`
    },
    
    deathDate: {
      sql: `death_date`,
      type: `time`
    },
    
    birthDate: {
      sql: `birth_date`,
      type: `time`
    }
  }
});
