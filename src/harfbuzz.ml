module Version = struct
  let major = C.Types.Version.major

  let micro = C.Types.Version.micro

  let minor = C.Types.Version.minor

  let string = C.Functions.Version.string ()
end