signature LOGGER =
sig
  val setLevel: Level.t -> unit
  val getLevel: unit -> Level.t

  val log: Level.t -> string -> unit
  val debug: string -> unit
  val info: string -> unit
  val warn: string -> unit
  val error: string -> unit
  val fatal: string -> unit
end
