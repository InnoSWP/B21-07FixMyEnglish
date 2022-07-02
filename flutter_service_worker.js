'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "c217c22b84e89f9b979a478d917a8199",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"index.html": "220608daa2c78697676efb74cf6f9886",
"/": "220608daa2c78697676efb74cf6f9886",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "b8db0c9c3893ac354d726426aef76ab9",
"version.json": "e8a2148839000d3d4469ddea5837fa5a",
"assets/json1": "16119cd5794eed1027a2874e56df384e",
"assets/Importpdficon.png": "2a829f4e86f338a0afc3d3c842dab5be",
"assets/Multiply.png": "fa2559e77ac8026b35ee6751ae18235b",
"assets/test_file_1.pdf": "953d747130e4015ea1a3406f413e2b2a",
"assets/Zoomall.png": "a0e0803eddcee98ab2903798d7f1cb19",
"assets/FontManifest.json": "4d527cc05d98482ad3432b6fdc422b03",
"assets/fonts/Eczar-VariableFont_wght.ttf": "5dc3ac94c73e6b380ad34da5ccf5df61",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/AssetManifest.json": "ccad400cd35f8566a75e166f7f71dc0e",
"assets/vectortransition.svg": "bd811665796e58dbd71c66d848ab5322",
"assets/json3": "5207a6745dbe3f23f4a20059ea82a755",
"assets/assets/json1": "16119cd5794eed1027a2874e56df384e",
"assets/assets/Importpdficon.png": "2a829f4e86f338a0afc3d3c842dab5be",
"assets/assets/Multiply.png": "fa2559e77ac8026b35ee6751ae18235b",
"assets/assets/test_file_1.pdf": "953d747130e4015ea1a3406f413e2b2a",
"assets/assets/Zoomall.png": "a0e0803eddcee98ab2903798d7f1cb19",
"assets/assets/vectortransition.svg": "bd811665796e58dbd71c66d848ab5322",
"assets/assets/json3": "5207a6745dbe3f23f4a20059ea82a755",
"assets/assets/copy.png": "de7accf8e6a1f838c35d7ad9fb39e053",
"assets/assets/leftbigwave.svg": "21b3345a24f5178b60d8a1db2e52dbc3",
"assets/assets/rightwave.svg": "cebee62090b2a64d04f20d51a1ae8b1e",
"assets/assets/json2": "c6e5ecd278009e2220cf62ee38555ffe",
"assets/assets/leftsmallwave.svg": "f8de4652c2be78bc3f58ba7e1dae710e",
"assets/assets/Plusmathicon.png": "1b7327e133c6cd0a3df0d7e78bf6a949",
"assets/assets/test_file_2.pdf": "9b737dcc22633e66613467d4b1207020",
"assets/copy.png": "de7accf8e6a1f838c35d7ad9fb39e053",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/leftbigwave.svg": "21b3345a24f5178b60d8a1db2e52dbc3",
"assets/NOTICES": "8575469971d299686b195477a800afdc",
"assets/rightwave.svg": "cebee62090b2a64d04f20d51a1ae8b1e",
"assets/json2": "c6e5ecd278009e2220cf62ee38555ffe",
"assets/leftsmallwave.svg": "f8de4652c2be78bc3f58ba7e1dae710e",
"assets/Plusmathicon.png": "1b7327e133c6cd0a3df0d7e78bf6a949",
"assets/test_file_2.pdf": "9b737dcc22633e66613467d4b1207020",
"main.dart.js": "b33e44858a5dd5b4dd2c0a6916bfbb1b",
"404.html": "0a27a4163254fc8fce870c8cc3a3f94f"
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
