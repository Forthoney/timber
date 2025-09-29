(* Create loggers with dynamically adjustable logging levels *)
functor DynamicLoggerFn(C: LOGGER_CONFIG): LOGGER =
struct
  type msg = {timestamp: Date.date, body: string}
  
  val level = ref Level.INFO

  fun setLevel l = level := l
  fun getLevel () = ! level

  fun log withLevel msg =
    case Level.compare (withLevel, ! level) of
      LESS => ()
    | _ =>
      let
        val timestamp = Date.fromTimeUniv (Time.now ())
        val msg =
          "[" ^ Date.fmt C.dateFmt timestamp ^ "]" ^
          "\t" ^
          Level.toString withLevel ^
          "\t" ^
          msg ^
          "\n"
      in
        (TextIO.output (C.out, C.postProcess msg); TextIO.flushOut C.out)
      end

  val debug = log Level.DEBUG
  val info = log Level.INFO
  val warn = log Level.WARN
  val error = log Level.ERROR
  val fatal = log Level.FATAL
end
