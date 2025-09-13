structure Level =
struct
  datatype t = DEBUG | INFO | WARN | ERROR | FATAL

  val toInt =
    fn DEBUG => 0
     | INFO => 1
     | WARN => 2
     | ERROR => 3
     | FATAL => 4

  val toString =
    fn DEBUG => "DEBUG"
     | INFO => "INFO"
     | WARN => "WARN"
     | ERROR => "ERROR"
     | FATAL => "FATAL"

  fun compare (l, r) =
    Int.compare (toInt l, toInt r)
end
