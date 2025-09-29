(* Create loggers with fixed logging levels.
 * On a defunctorizing compiler, this may allow for slightly more performant logging.
 * The `level` reference variable is actually ignored and mutating it will NOT change the log level.
 *)
functor StaticLoggerFn(structure C: LOGGER_CONFIG val level: Level.t): LOGGER =
struct
  type msg = {timestamp: Date.date, body: string}
  
  fun setLevel l = ()
  fun getLevel () = level

  fun log withLevel msg =
    case Level.compare (withLevel, level) of
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
