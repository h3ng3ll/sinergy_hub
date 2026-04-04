importScripts("https://www.gstatic.com/firebasejs/12.11.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/12.11.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: "AIzaSyA3KKZzkv7TFFca15OX6qwW402RW-HJDf0",
    authDomain: "synergyhub-a3e1b.firebaseapp.com",
    databaseURL: "https://synergyhub-a3e1b-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "synergyhub-a3e1b",
    storageBucket: "synergyhub-a3e1b.firebasestorage.app",
    messagingSenderId: "752696702645",
    appId: "1:752696702645:web:dce83733b95204324d30fc"

});

const baseUrl= "https://synergyhub-a3e1b.web.app"
const messaging = firebase.messaging();

async function _processPayload(payload) {
    const title = payload.notification?.title || payload.data?.title;
    const body = payload.notification?.body || payload.data?.body;

    await self.registration.showNotification(title, {
        body: body,
        icon: 'https://synergyhub-a3e1b.web.app/icons/icon-192.png',
        // badge: 'https://synergyhub-a3e1b.web.app/icons/badge.png',
        data: payload.data,
    });
}

/// On Macos Chrome and Firefox disabled notifications and it won't shows by default
/// Trigger when tab closed or in background
messaging.onBackgroundMessage(async (payload) => {
    console.log('Received background message:', payload);
    await _processPayload(payload);
});
/// Foreground message . Comes from flutter when called  _flutterLocalNotificationsPlugin.show()
messaging.onMessage(async (payload) => {
    console.log('onMessage: Received message from Native Web:', payload);
    await _processPayload(payload);
});

/// Occur If Popup message from foreground after user decide click on it .
self.addEventListener(
    'notificationclick',
    function (event) {
        event.notification.close();

        const data = event.notification.data || {};

        event.waitUntil(
            (async () => {
                const url = getUrlByType(data);
                await clients.openWindow(
                    url,
                );
            })()
        );
    }
);

const routes = {
    chat: (d) => `${baseUrl}/matches/${d.chatId}`,
    match: (d) => `${baseUrl}/discovery`,
};

function getUrlByType(data) {
    return routes[data.type]?.(data) || '/';
}
