'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "a2fd9065ebbc50c2e9ee9baf49b7df1b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "85f11bd194dccc54e63f75e3142ea8ef",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/snippet/alert.basic.snippet": "257186f70fa88bbb1ec3323b8e2ed1c6",
"assets/snippet/breadcrumb.basic.snippet": "9a6e92dfd2ea50478a2e17844134a84a",
"assets/snippet/button.type.snippet": "30ecfd734a496f7ac875a5f2bf510f0c",
"assets/snippet/card.classic.snippet": "54831e7ec28acf884c7887dae6f9133f",
"assets/snippet/checkbox.basic.snippet": "1f2c3b0a51b833efc6a63700ac77ef20",
"assets/snippet/demo.dart": "f1960eeedb91b175575b0237f19d17bf",
"assets/snippet/divider.horizontal.snippet": "990993963d521808fe5fa3179a3e9aa5",
"assets/snippet/drawer.basic.snippet": "9ba44309bb111713570b029e06e6e7d5",
"assets/snippet/image.basic.snippet": "4607128a9bef76962ce76335c04871f6",
"assets/snippet/input.basic.snippet": "f2d66fbf133a53f9108929e254c2a680",
"assets/snippet/input_number.basic.snippet": "f492c2356911d85ed6fd4832116957af",
"assets/snippet/menu.inline_collapsed.snippet": "2c84305e8c7b22a7c82703b1d12cd20f",
"assets/snippet/message.basic.snippet": "be28373a8fbb7fa979deee0199765d6c",
"assets/snippet/modal.basic.snippet": "2536b46d91ab896150cf457e39e1b5d7",
"assets/snippet/notification.basic.snippet": "f1960eeedb91b175575b0237f19d17bf",
"assets/snippet/page_header.standard.snippet": "2256ba0a6617c227231b8a2ee13e53e5",
"assets/snippet/pagination.basic.snippet": "699a599c084dde45c911aadf21de7c3a",
"assets/snippet/radio.basic.snippet": "4237a92ee2199dc2ce8c4fe4bd130a5e",
"assets/snippet/select.basic.snippet": "119734f10250ceb723bb8438c7ee60f0",
"assets/snippet/slider.basic.snippet": "aeef66b6483f554952f0fc0ecba2c9e0",
"assets/snippet/space.basic.snippet": "1e50d3029bd60572edf21fb3a3a1aa89",
"assets/snippet/switch.basic.snippet": "48894a3b454fde9f9840f11cb9f4e5c5",
"assets/snippet/table.basic.snippet": "3d39743cd2f743522e847d239833a146",
"assets/snippet/tabs.basic.snippet": "69d1208aa1cf019dca087e060963f934",
"assets/snippet/tag.basic.snippet": "235a33d47cfbe61c860289a690c2314e",
"assets/snippet/tooltip.basic.snippet": "7fab75377f8514208de22ab3fe9e31e6",
"assets/snippet/typography.title.snippet": "8ad0682afe4c7fa46bac338a6e735fad",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "20254fcc444cdafd9a7efd0ce650fd25",
"/": "20254fcc444cdafd9a7efd0ce650fd25",
"main.dart.js": "ed70d9095b54cf10370f94759cb257a5",
"manifest.json": "5a9eb9da0a1d5d86f6bca320632a4093",
"version.json": "350ad229dcbadce74e62729cdfbeb20e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
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
