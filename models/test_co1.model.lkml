connection: "google_analytics_sample"
include: "../DataTest.lkml"


include: "../views/*.view"
datagroup: test_co1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_co1_default_datagroup

map_layer: world_admin_map {
  file: "/WB_countries_Admin0_topojson.json"  # need / before the file name
  property_key: "NAME_EN"
}
# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: ga_sessions_20170127 {
  label: "Google Analytics data a/o Jan 27,2017"

  always_filter: {
    filters: {
      field: ga_sessions_20170127__hits__product__custom_dimensions.OR_Filter
      value: "no"
    }
  }

  join: ga_sessions_20170127__hits {
    view_label: "Ga Sessions 20170127: Hits"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127.hits}) as ga_sessions_20170127__hits ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__product {
    view_label: "Ga Sessions 20170127: Hits Product"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.product}) as ga_sessions_20170127__hits__product ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__custom_dimensions {
    view_label: "Ga Sessions 20170127: Customdimensions"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127.custom_dimensions}) as ga_sessions_20170127__custom_dimensions ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__promotion {
    view_label: "Ga Sessions 20170127: Hits Promotion"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.promotion}) as ga_sessions_20170127__hits__promotion ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__custom_metrics {
    view_label: "Ga Sessions 20170127: Hits Custommetrics"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.custom_metrics}) as ga_sessions_20170127__hits__custom_metrics ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__custom_variables {
    view_label: "Ga Sessions 20170127: Hits Customvariables"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.custom_variables}) as ga_sessions_20170127__hits__custom_variables ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__custom_dimensions {
    view_label: "Ga Sessions 20170127: Hits Customdimensions"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.custom_dimensions}) as ga_sessions_20170127__hits__custom_dimensions ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__experiment {
    view_label: "Ga Sessions 20170127: Hits Experiment"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.experiment}) as ga_sessions_20170127__hits__experiment ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__publisher_infos {
    view_label: "Ga Sessions 20170127: Hits Publisher Infos"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits.publisher_infos}) as ga_sessions_20170127__hits__publisher_infos ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__product__custom_metrics {
    view_label: "Ga Sessions 20170127: Hits Product Custommetrics"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits__product.custom_metrics}) as ga_sessions_20170127__hits__product__custom_metrics ;;
    relationship: one_to_many
  }

  join: ga_sessions_20170127__hits__product__custom_dimensions {
    view_label: "Ga Sessions 20170127: Hits Product Customdimensions"
    sql: LEFT JOIN UNNEST(${ga_sessions_20170127__hits__product.custom_dimensions}) as ga_sessions_20170127__hits__product__custom_dimensions ;;
    relationship: one_to_many
  }
}
