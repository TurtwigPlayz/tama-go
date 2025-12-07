'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b217bfad4044b8695348f5fd84211366",
"assets/AssetManifest.bin.json": "84d1dc482ce430306a968d6daad3d5bb",
"assets/AssetManifest.json": "2570fa67135027b332367e5dcb3b9a1c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "8b9f78836ae19cc93d2b14b1f45e41a0",
"assets/images/logo.png": "c7c7b539d00993ce284d061e13cdf4d1",
"assets/images/menu/avacadoSalad.jpg": "f10905133c344fa63fcca6a27a999ee8",
"assets/images/menu/beef.jpg": "1c00f8a1eba819dd8f63524c34999751",
"assets/images/menu/Chicken.jpg": "81284ab8348084f7da646b979c9062ae",
"assets/images/menu/crab.jpg": "32b27dedc5409f8cb3153dab903c6d70",
"assets/images/menu/Cucumber.jpg": "f5ebcc88c2ea40d57f9823375944a1ab",
"assets/images/menu/edamame.jpg": "81a501c4d2ab8f850d4ace96fda0983d",
"assets/images/menu/HiShrimp.jpg": "0446d48042fd3c667af7d97dee492583",
"assets/images/menu/juice.jpg": "4acc387a8773cdf092d23219f3f6f005",
"assets/images/menu/Kani.jpg": "3784180ebc46b96a2cb5e5b711f8da0d",
"assets/images/menu/korean_pear_juice.jpg": "dba54d74cb1ecd06b154be91c8da4238",
"assets/images/menu/Masago.jpg": "854d0ca7fdd8802cef21789d5a7478ba",
"assets/images/menu/milkis_soda.jpg": "8ebf863eb468afbe1bea32500e6137e7",
"assets/images/menu/Miso-Soup.jpg": "c24ba4888e790963b06257f3f0cdc85b",
"assets/images/menu/pop.jpg": "f449b5c8bdfcd97a1355d627f5ba4b50",
"assets/images/menu/rice.jpg": "6a431331ff7d18542a5c4ab1f53b33ac",
"assets/images/menu/Salmon.jpg": "85f344f63844653e69fcf548a5ea96dc",
"assets/images/menu/seaweed.jpg": "e9a12e5b18b1ef0e3e10cadd0d050721",
"assets/images/menu/Shrimp.jpg": "8c4c62328598d55b8081ed2fbc915fd7",
"assets/images/menu/ShrimpSushi.jpg": "59cdba9f2893fcdaf3740649a0dc248c",
"assets/images/menu/shumai.jpg": "305e44e8de007685c8ae7bc930dc104f",
"assets/images/menu/spring.jpg": "9ca3f49146a9fa9b4548befa73c37938",
"assets/images/menu/Steak.jpg": "a26022e2629e975ee45d1b40a4498a2b",
"assets/images/menu/Tuna.jpg": "fffaef7d924976df7c77a8d0ef80c974",
"assets/images/menu/water.jpg": "b9bd7d77d6029b85dc4798988ade504f",
"assets/images/menu/White.jpg": "4ea8a633ac2c96e15bc3db01c6a3b91b",
"assets/images/menu/Yakisoba.jpg": "ef1bbe952748c69ea315eb6e9c788ec8",
"assets/NOTICES": "ca00de7dc9e2379ba51515541009724c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "1271ebff9d0e0b3783f40efb85cf4f70",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ac6c1f5fa26b718a183cdf5f482e8f36",
"/": "ac6c1f5fa26b718a183cdf5f482e8f36",
"main.dart.js": "e0d94a072fb696fe7d848151f6910d87",
"manifest.json": "3b151e987f2327cfffd3a7dd69e1d2c4",
"version.json": "7e2409a2ceee377dfe2b5fd983e9c829"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
