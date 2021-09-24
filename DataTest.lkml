test: not_null {
  explore_source: ga_sessions_20170127 {
    column: device__browser {}
#    column: device__is_mobile {}
  }

assert: device__is_mobiler_not_null {
  expression: NOT is_null(${ga_session_20170127.device__is_mobile}) ;;
  }
}
