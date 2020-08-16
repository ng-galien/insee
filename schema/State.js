cube(`States`, {
  sql: `SELECT * FROM public.state`,
  
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
    }
  }
});
