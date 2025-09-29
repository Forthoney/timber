# Timber
A logging library for Standard ML

## Usage
The library provides two classes of loggers as well as a functor to construct custom loggers.
The two broad classes are dynamic loggers and static loggers.
Dynamic loggers allow for adjusting the log level at runtime and is thus the more flexible and powerful of the two.
This should be the go-to logger for most scenarios.

In performance critical scenarios, applications can use a static logger which fixes the log level at some value,
allowing for more optimizations by the compiler.
In such environments, the application can use a dynamic logger for non-production or canary deployments
and switch to a static logger to squeeze out every last bit of performance in production.
This can be done through a straightforward ML Basis import technique
```mlb
local
  timber/sources.mlb
in
  (* use the following line in production *)
  structure Logger = FatalLogger
end
```

## Planned features
- [] Option for finer grained formatting of time (nanosecond)
