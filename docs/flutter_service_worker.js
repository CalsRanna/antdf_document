'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "350ad229dcbadce74e62729cdfbeb20e",
"index.html": "1e9f878f45dc2cad4366743a26e93a02",
"/": "1e9f878f45dc2cad4366743a26e93a02",
"main.dart.js": "52e07eec4ea6292bdd668cff8046125c",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "880c5380e3a54bd40b389ed9af3a2475",
"assets/AssetManifest.json": "23845550367d8c9863c03da286cd5ea2",
"assets/snippet/menu.inline_collapsed.snippet": "cacb5897dd6af30ee10af366bdf5a3e1",
"assets/snippet/space.basic.snippet": "a400061c750438f0248c6dd8f94446a3",
"assets/snippet/typography.title.snippet": "d20a10efefe943c7ba95b5cf6a990b27",
"assets/snippet/checkbox.basic.snippet": "97202fcc1aeeba6ce10aa779c8896e30",
"assets/snippet/drawer.basic.snippet": "095be5e5dba746767172e1deccc574b8",
"assets/snippet/alert.basic.snippet": "2fe952b43835ec45fdefc4d21d6e9d8a",
"assets/snippet/pagination.basic.snippet": "f1386841471eb536ad362b4da6c3865a",
"assets/snippet/tabs.basic.snippet": "deddd3663ee83438593682791461a99d",
"assets/snippet/card.classic.snippet": "30d38a86a75bdec9154cb517c96cf8f9",
"assets/snippet/button.type.snippet": "0d40d2d179bc626c00f0be2d321dd7c6",
"assets/snippet/tag.basic.snippet": "5958d5d23646184ff7b2225f1b088d00",
"assets/snippet/tooltip.basic.snippet": "3226cf51902054f272e076c6221c803e",
"assets/snippet/input.basic.snippet": "be6b8f573230e082ea64a87d569d9e09",
"assets/snippet/table.basic.snippet": "30969f492376ede67195bdc82e952327",
"assets/snippet/input_number.basic.snippet": "0f61036447e3e3c6c3cbba3796f1f713",
"assets/snippet/select.basic.snippet": "57d2ff1e302491b708bf91da2c25ad75",
"assets/snippet/icon.basic.snippet": "016bca451a6dfda74f05803431b5443c",
"assets/snippet/slider.basic.snippet": "f69d7bb5c6581963bfaf50fce002cd66",
"assets/snippet/radio.basic.snippet": "30b6a318294fcb77adf9b4bdb1cf115d",
"assets/snippet/notification.basic.snippet": "ed2be64d11fa8e7c1af06195e3c070a4",
"assets/snippet/modal.basic.snippet": "af924b588f93db36029616e4113e98f1",
"assets/snippet/button.size.snippet": "54a00bf83faa29758bd7b1bfc1a0d940",
"assets/snippet/page_header.standard.snippet": "4d7e4fd1e29de1a07a6b36bec7d84dc3",
"assets/snippet/breadcrumb.basic.snippet": "26e7f12d9322e7777d3e5afa215ace04",
"assets/snippet/message.basic.snippet": "45c838d6bcf34335489db15378676e11",
"assets/snippet/divider.horizontal.snippet": "69992455dc8b4a94d008cb1d36b29331",
"assets/snippet/switch.basic.snippet": "f9bcdbe0560d2811d1285b5f54c6cfe2",
"assets/snippet/image.basic.snippet": "e35ce909449bb4b0554f30a76e2fa36b",
"assets/snippet/demo.dart": "54a00bf83faa29758bd7b1bfc1a0d940",
"assets/NOTICES": "c9dbafa7127b965c05b01235c019938b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
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
