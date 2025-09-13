signature LOGGER_CONFIG =
sig
  (* location to write the logs to *)
  val out: TextIO.outstream
  (* date format *)
  val dateFmt: string
  (* postprocessing to apply to the message *)
  val postProcess: string -> string
end
