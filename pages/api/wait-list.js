import { createClient } from '@supabase/supabase-js'
import Cors from 'cors'

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_ANON_KEY
)

const DUPLICATED_USER_ERROR_CODE = 23505

const cors = Cors({
  methods: [],
})

function runMiddleware(req, res,fn) {
  return new Promise((resolve, reject) => {
    fn(req, res, (result) => {
      if (result instanceof Error) {
        return reject(result)
      }

      return resolve(result)
    })
  })
}

export default async function handler(req, res) {
  await runMiddleware(req, res, cors)

  if (req.method === "POST") {
    const { email } = req.body;
    if (!email) {
      return res.status(400).json({
        message: "need params in request",
      });
    }
  
    const { error } = await supabase
      .from('waiting')
      .insert({ email }, { returning: 'minimal' })

    if (error) {
      if (error.code == DUPLICATED_USER_ERROR_CODE) {
          return res.status(400).json({
          message: 'user not allow'
        })
      }
      return res.status(500).json({
        error,
      });
    }

    return res.status(200).json({
      message: "email saved",
    });
  }
  return res.status(405).json({ message: "method not allowed" });
}



