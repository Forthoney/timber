local
  structure DefaultConfig =
  struct
    val out = TextIO.stdErr
    val dateFmt = "%Y-%m-%dT%H:%M:%S"
    val postProcess = fn s => s
  end
in
  structure Logger = LoggerFn(DefaultConfig) 
end
