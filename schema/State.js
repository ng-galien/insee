cube(`States`, {
  sql: `SELECT * FROM public.state`,
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, name]
    }
  },
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },

    code: {
      sql: `code`,
      type: `string`
    },
    
    name: {
      sql: `name`,
      type: `string`
    },

    region: {
      sql: `region`,
      type: `string`
    },

    malePopCat1: {
      sql: `h_pop_cat_1`,
      type: `number`
    },
    malePopCat2: {
      sql: `h_pop_cat_2`,
      type: `number`
    },
    malePopCat3: {
      sql: `h_pop_cat_13`,
      type: `number`
    },
    malePopCat4: {
      sql: `h_pop_cat_4`,
      type: `number`
    },
    malePopCat5: {
      sql: `h_pop_cat_5`,
      type: `number`
    },
    malePopTot: {
      sql: `h_pop_cat_tot`,
      type: `number`
    },

    femalePopCat1: {
      sql: `f_pop_cat_1`,
      type: `number`
    },
    femalePopCat1: {
      sql: `f_pop_cat_2`,
      type: `number`
    },
    femalePopCat1: {
      sql: `f_pop_cat_3`,
      type: `number`
    },
    femalePopCat1: {
      sql: `f_pop_cat_4`,
      type: `number`
    },
    femalePopCat1: {
      sql: `f_pop_cat_5`,
      type: `number`
    },
    femalePopTot: {
      sql: `f_pop_cat_tot`,
      type: `number`
    },

    popCat1: {
      sql: `tot_pop_cat_1`,
      type: `number`
    },
    popCat2: {
      sql: `tot_pop_cat_2`,
      type: `number`
    },
    popCat3: {
      sql: `tot_pop_cat_3`,
      type: `number`
    },
    popCat4: {
      sql: `tot_pop_cat_4`,
      type: `number`
    },
    popCat5: {
      sql: `tot_pop_cat_5`,
      type: `number`
    },
    popTot: {
      sql: `tot_pop`,
      type: `number`
    },

    diab: {
      sql: `diab`,
      type: `number`
    }

  }
});
