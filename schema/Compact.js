cube('InseeStat', {
    sql: 'SELECT * FROM public.insee_stat',

    
    measures: {
      Total: {
        type: 'sum',
        sql: 'sum_tot',
        drillMembers: [date],
        title: "Total"
      },
      TotalMale: {
        type: 'sum',
        sql: 'sum_male',
        drillMembers: [date],
        title: "Total Male"
      },
      TotalFemale: {
        type: 'sum',
        sql: 'sum_female',
        drillMembers: [date],
        title: "Total Female"
      },
      TotalCat1: {
        type: 'sum',
        sql: 'sum_cat_1',
        drillMembers: [date],
        title: "Total 0-19"
      },
      TotalCat2: {
        type: 'sum',
        sql: 'sum_cat_2',
        drillMembers: [date],
        title: "Total 20-39"
      },
      TotalCat3: {
        type: 'sum',
        sql: 'sum_cat_3',
        drillMembers: [date],
        title: "Total 40-59"
      },
      TotalCat4: {
        type: 'sum',
        sql: 'sum_cat_4',
        drillMembers: [date],
        title: "Total 60-74"
      },
      TotalCat5: {
        type: 'sum',
        sql: 'sum_cat_5',
        drillMembers: [date],
        title: "Total 75 +"
      },
      TotalNorm: {
        type: 'sum',
        sql: 'norm_tot',
        drillMembers: [date],
        title: "Normalized"
      },
      NormCat1: {
        type: 'sum',
        sql: 'norm_cat_1',
        drillMembers: [date],
        title: "Normalized 0-19"
      },
      NormCat2: {
        type: 'sum',
        sql: 'norm_cat_2',
        drillMembers: [date],
        title: "Normalized 20-39"
      },
      NormCat3: {
        type: 'sum',
        sql: 'norm_cat_3',
        drillMembers: [date],
        title: "Normalized 40-50"
      },
      NormCat4: {
        type: 'sum',
        sql: 'norm_cat_4',
        drillMembers: [date],
        title: "Normalized 60-74"
      },
      NormCat5: {
        type: 'sum',
        sql: 'norm_cat_5',
        drillMembers: [date],
        title: "Normalized 75+"
      },
      NormMale: {
        type: 'sum',
        sql: 'norm_male',
        drillMembers: [date],
        title: "Normalized Male"
      },
      NormFemale: {
        type: 'sum',
        sql: 'norm_female',
        drillMembers: [date],
        title: "Normalized Female"
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
  