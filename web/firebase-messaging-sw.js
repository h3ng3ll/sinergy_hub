importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js");

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;


firebase.initializeApp({
    apiKey: "AIzaSyA3KKZzkv7TFFca15OX6qwW402RW-HJDf0",
    authDomain: "synergyhub-a3e1b.firebaseapp.com",
    databaseURL: "https://synergyhub-a3e1b-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "synergyhub-a3e1b",
    storageBucket: "synergyhub-a3e1b.firebasestorage.app",
    messagingSenderId: "752696702645",
    appId: "1:752696702645:web:dce83733b95204324d30fc"

});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});

// const messaging = firebase.messaging();
//
// messaging.onBackgroundMessage(function (payload) {
//     console.log("[firebase-messaging-sw.js] Received background message ", payload);
//
//     self.registration.showNotification(payload.notification.title, {
//         body: payload.notification.body,
//     });
// })

// messaging.onBackgroundMessage(function (payload) {
//     console.log("SW PUSH:", payload);
//
//     self.registration.showNotification(payload.notification.title, {
//         body: payload.notification.body,
//         payload: payload.data,
//     });
//
//     /// onClickMessage
//     self.addEventListener(
//         "notificationclick",
//         function (event) {
//             console.log("SW Notification Click:", payload);
//
//             const data = event.notification.data;
//             event.waitUntil(
//                 clients.openWindow(
//                     '/#/chat?userId=' + data.userId
//                 )
//             )
//         },
//     );
// });