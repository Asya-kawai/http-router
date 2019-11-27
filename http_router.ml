module Context = struct 
  type t = string list
  let empty = []
  (* lst is list. *)
  let create lst = lst
  (* fst is the first element, scd is the second element. *)
  let concat fst scd = List.concat [fst; scd]

  let get_all t = t
  let nth = List.nth
end


module Path = struct
  type t = 
    | StringPath of string
  let str s = StringPath s
end

module Route = struct
  type t = {
    (* meth is method *)
    meth: cohttp.Code.meth;
    paths: Path.t list
  }
  let get = { meth = `GET; paths = [] }
  let post = { meth = `POST; paths = [] }
  let put = { meth = `PUT; paths = [] }
  let delete = { meth = `DELETE; paths = [] }
  let patch = { meth = `PATCH; paths = [] }

  (* !!! *)
  let append_path t p = 
    { t with paths = t.paths @ [p] }
  let meth t = t.meth
  let paths t = t.paths

  module Infix = struct
    let (/) r s = append_path r (Path.str)
  end
end
