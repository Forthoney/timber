local
  structure DefaultConfig =
  struct
    val out = TextIO.stdErr
    val dateFmt = "%Y-%m-%dT%H:%M:%S"
    val postProcess = fn s => s
  end
in
  structure Logger = DynamicLoggerFn(DefaultConfig) 
  structure DebugLogger = StaticLoggerFn(structure C = DefaultConfig val level = Level.DEBUG)
  structure InfoLogger = StaticLoggerFn(structure C = DefaultConfig val level = Level.INFO)
  structure WarnLogger = StaticLoggerFn(structure C = DefaultConfig val level = Level.WARN)
  structure ErrorLogger = StaticLoggerFn(structure C = DefaultConfig val level = Level.ERROR)
  structure FatalLogger = StaticLoggerFn(structure C = DefaultConfig val level = Level.FATAL)
end
