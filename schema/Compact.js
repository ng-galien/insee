cube('InseeCompact', {
    sql: 'SELECT * FROM public.insee_compact',

    
    measures: {
      Total: {
        type: 'sum',
        sql: 'tot',
        drillMembers: [date],
        title: "Total"
      },
      TotalCat1: {
        type: 'sum',
        sql: 'cat_1',
        drillMembers: [date],
        title: "Total 0-19"
      },
      TotalCat2: {
        type: 'sum',
        sql: 'cat_2',
        drillMembers: [date],
        title: "Total 20-39"
      },
      TotalCat3: {
        type: 'sum',
        sql: 'cat_3',
        drillMembers: [date],
        title: "Total 40-59"
      },
      TotalCat4: {
        type: 'sum',
        sql: 'cat_4',
        drillMembers: [date],
        title: "Total 60-74"
      },
      TotalCat5: {
        type: 'sum',
        sql: 'cat_5',
        drillMembers: [date],
        title: "Total 75 +"
      },
      TotalNorm: {
        type: 'sum',
        sql: 'tot_norm',
        drillMembers: [date],
        title: "Total(N)"
      },
      TotalCat4: {
        type: 'sum',
        sql: 'cat_4_norm',
        drillMembers: [date],
        title: "Total(N) 60-74"
      },
      TotalCat5: {
        type: 'sum',
        sql: 'cat_5_norm',
        drillMembers: [date],
        title: "Total(N) 75 +"
      }

    },
    dimensions: {
    id: {
        sql: 'id',
        type: 'number',
        primaryKey: true
        },
      date: {
        sql: 'date',
        type: 'time'
      },
      state: {
        sql: 'state',
        type: 'string'
      },
      region: {
        sql: 'region',
        type: 'string'
      }
  
    }
  });
  