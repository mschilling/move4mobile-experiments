import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'

export const listener = functions.https.onRequest(async (req, res) => {

    let payload = { 
        method: req.method,
        headers: req.headers, 
        body: req.body 
    }
    
    const snapshot = await admin.database().ref('/echo-service').push(payload)
    let responseText = (req.body.text && !req.body.bot_id) ? req.body.text : 'You got it!!';
    res.send({ text: responseText})
    // res.redirect(303, snapshot.ref)
})