open AncestorSite
open ReactToastify

type responseData = {message: string}

module Response = {
  type t<'data>
  @send external json: t<responseData> => Promise.t<responseData> = "json"
}

@val @scope("globalThis")
external fetch: (string, 'params) => Promise.t<Response.t<responseData>> = "fetch"

let addEmail = data => {
  open Promise
  let params = {
    "method": "POST",
    "headers": {
      "Content-Type": "application/json",
    },
    "body": Js.Json.stringifyAny(data),
  }
  fetch("/api/wait-list", params)
  ->then(res => {
    Response.json(res)
  })
  ->then(data => {
    // Notice our pattern match on the "error" / "token" fields
    // to determine the final result. Be aware that this logic highly
    // depends on the backend specificiation.
    let message = data.message
    Ok(message)->resolve
  })
  ->catch(e => {
    let msg = switch e {
    | JsError(err) =>
      switch Js.Exn.message(err) {
      | Some(msg) => msg
      | None => ""
      }
    | _ => "Unexpected error occurred"
    }
    Error(msg)->resolve
  })
}

let default = () => {
  let (email, setEmail) = React.useState(() => "")
  let (error, setError) = React.useState(() => "")

  let cb = {
    Js.log("Cool")
    ()
  }

  <Box
    display={xs: #flex}
    justifyContent={xs: #"flex-start", lg: #"space-between"}
    alignItems={xs: #center}
    flexDirection={xs: #column}
    tag=#form
    onSubmit={event => {
      ReactEvent.Synthetic.preventDefault(event)
      Js.log(email)
      if Js.String2.length(email) <= 3 {
        setError(_ => "deu ruim")
        toast->warning(
          "Digite um email valido",
          ReactToastify.options(
            ~autoClose=3000,
            ~hideProgressBar=false,
            ~closeOnClick=false,
            ~onClose=cb,
            (),
          ),
        )
      } else {
        let _ =
          addEmail({"email": email})
          ->Promise.then(result => {
            let a = switch result {
            | Belt.Result.Ok(message) => {
                setEmail(_ => "")
                setError(_ => "")
                toast->success(
                  message,
                  ReactToastify.options(
                    ~autoClose=3000,
                    ~hideProgressBar=false,
                    ~closeOnClick=false,
                    ~onClose=cb,
                    (),
                  ),
                )
              }

            | Belt.Result.Error(message) => {
                toast->warning(
                  message,
                  ReactToastify.options(
                    ~autoClose=3000,
                    ~hideProgressBar=false,
                    ~closeOnClick=false,
                    ~onClose=cb,
                    (),
                  ),
                )

                setError(_ => message)
              }
            }
            Promise.resolve(a)
          })
          ->Promise.catch(_err => {
            setError(_ => "Fail")
            Promise.resolve()
          })
      }
    }}>
    <Typography
      className={Animations.fadeIn(~delay=250, ())}
      tag=#h1
      textAlign={xs: #center}
      m={xs: 0.0}
      fontSize={xs: 3.2->#rem, md: 4.6->#rem}
      color={xs: #black}
      fontFamily={xs: [Theme.Fonts.recoleta]->#custom}>
      {`Se inscreva`->React.string}
    </Typography>
    <Base
      fontSize={xs: 2.0->#rem}
      tag=#input
      type_="email"
      placeholder="Email"
      value=email
      onChange={event => {
        let value = ReactEvent.Form.currentTarget(event)["value"]
        setEmail(_ => value)
      }}
    />
    {error->React.string}
    <Box mt={xs: 2.0} mb={xs: 2.0}>
      <Base
        bgColor={xs: #black}
        fontSize={xs: 2.0->#rem}
        color={xs: #light}
        borderStyle={xs: #none}
        borderRadius={xs: 1.0}
        p={xs: 1.0}
        tag=#button
        disabled={Js.String2.length(email) <= 3}>
        {"Cadastrar"->React.string}
      </Base>
    </Box>
  </Box>
}
