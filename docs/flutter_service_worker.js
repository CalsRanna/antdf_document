'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "23845550367d8c9863c03da286cd5ea2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "1a8e7ea2c091c1c14d988127c65a56ae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/snippet/alert.basic.snippet": "499824f70dc7ae4b7137dcc520626941",
"assets/snippet/breadcrumb.basic.snippet": "f0faa42d0b723c849fc0e0adeaa5c120",
"assets/snippet/button.size.snippet": "03ca418f28bb5006cd2bdb80f6d1c8a4",
"assets/snippet/button.type.snippet": "db76ec8313b01228335921cec0366b19",
"assets/snippet/card.classic.snippet": "66e75ae8988c36733c94dc06027267d9",
"assets/snippet/checkbox.basic.snippet": "5edbc63142daba8080f8db9398c646fd",
"assets/snippet/demo.dart": "03ca418f28bb5006cd2bdb80f6d1c8a4",
"assets/snippet/divider.horizontal.snippet": "75eacc1aab9bce3ee8030523552d4804",
"assets/snippet/drawer.basic.snippet": "0c0528db47bc8c737e37ffcd47c5b988",
"assets/snippet/icon.basic.snippet": "b84f08829b01b3bda972bd69697a0be4",
"assets/snippet/image.basic.snippet": "9b03da18f7e262a9240976631af1524b",
"assets/snippet/input.basic.snippet": "78512bab8b3758327fcf3bfef38cbe1d",
"assets/snippet/input_number.basic.snippet": "d5b4e706ff54adba0b2721877e08bf57",
"assets/snippet/menu.inline_collapsed.snippet": "edfa0d21f9483301ba92376b8c9fbb66",
"assets/snippet/message.basic.snippet": "bf196a87447145a504cc88eabba93b46",
"assets/snippet/modal.basic.snippet": "d34a1254173b4d15db1bad1499572918",
"assets/snippet/notification.basic.snippet": "9f05b099552a9de4c9cebe8dd5dffc39",
"assets/snippet/page_header.standard.snippet": "4f455f8138d2b9b03a8c58ca692f247d",
"assets/snippet/pagination.basic.snippet": "528358addc9aafdb9010e2065bc8b33e",
"assets/snippet/radio.basic.snippet": "dddf8c7a5bf79c0c1eb45f2171402c49",
"assets/snippet/select.basic.snippet": "a537962fd611013e07aa0f632553ce6c",
"assets/snippet/slider.basic.snippet": "981c6308c25775e3db8456ee77fd7af8",
"assets/snippet/space.basic.snippet": "491de5447ee0d0f490372b1f6072a5a6",
"assets/snippet/switch.basic.snippet": "ee5c5e7439af0a5a0587de9912804547",
"assets/snippet/table.basic.snippet": "ade37325062663432b1fffac81012431",
"assets/snippet/tabs.basic.snippet": "d256bb1db45a0ae6dbb7eee9aee9f5bd",
"assets/snippet/tag.basic.snippet": "58c8e9314c209abae4c9e930fa300eb6",
"assets/snippet/tooltip.basic.snippet": "a6b6b88a08ef9da9195bce3b5208e6dd",
"assets/snippet/typography.title.snippet": "e007fd2568c03b60245fe19b3df49495",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5ce88f9ba4cfaa06691458a53969ad03",
"/": "5ce88f9ba4cfaa06691458a53969ad03",
"main.dart.js": "ccca2712d9d52be52e55c5625c767b25",
"manifest.json": "5a9eb9da0a1d5d86f6bca320632a4093",
"version.json": "350ad229dcbadce74e62729cdfbeb20e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
