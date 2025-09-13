signature LOGGER =
sig
  val level: Level.t ref

  val log: Level.t -> string -> unit
  val debug: string -> unit
  val info: string -> unit
  val warn: string -> unit
  val error: string -> unit
  val fatal: string -> unit
end
