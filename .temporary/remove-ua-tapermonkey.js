// ==UserScript==
// @name         Remove UA
// @namespace    http://*/*
// @namespace    https://*/*
// @version      0.1
// @description  remove UA
// @author       ok-john
// @match        http://*/*
// @match        https://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// @run-at       document-start
// ==/UserScript==

!function() {
    var _obj = "eyJ1c2VyQWdlbnQiOiIiLCJhcHBWZXJzaW9uIjoiIiwicGxhdGZvcm0iOiIiLCJ2ZW5kb3IiOiJHb29nbGUgSW5jLiIsInByb2R1Y3QiOiIiLCJ1c2VyQWdlbnREYXRhIjoiW2RlbGV0ZV0iLCJvc2NwdSI6IltkZWxldGVdIiwiYnVpbGRJRCI6IltkZWxldGVdIiwicHJvZHVjdFN1YiI6IltkZWxldGVdIiwicGx1Z2lucyI6IltkZWxldGVdIiwibWltZVR5cGVzIjoiW2RlbGV0ZV0iLCJjb29raWVFbmFibGVkIjp0cnVlLCJjbGlwYm9hcmQiOiJbZGVsZXRlXSJ9";
    const o =JSON.parse(decodeURIComponent(atob(_obj)));

	 if (o.userAgentDataBuilder) {
   const v = new class NavigatorUAData {
     #p;

     constructor({p, ua}) {
       this.#p = p;

       const version = p.browser.major;
       const name = p.browser.name === 'Chrome' ? 'Google Chrome' : p.browser.name;

       this.brands = [{
         brand: name,
         version
       }, {
         brand: 'Chromium',
         version
       }, {
         brand: 'Not=A?Brand',
         version: '24'
       }];

       this.mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(ua);

       this.platform = 'Unknown';
       if (p.os && p.os.name) {
         const name = p.os.name.toLowerCase();
         if (name.includes('mac')) {
           this.platform = 'macOS';
         }
         else if (name.includes('debian')) {
           this.platform = 'Linux';
         }
         else {
           this.platform = p.os.name;
         }
       }
     }
     toJSON() {
       return {
         brands: this.brands,
         mobile: this.mobile,
         platform: this.platform
       };
     }
     getHighEntropyValues(hints) {
       if (!hints || Array.isArray(hints) === false) {
         return Promise.reject(Error("Failed to execute 'getHighEntropyValues' on 'NavigatorUAData'"));
       }

       const r = this.toJSON();

       if (hints.includes('architecture')) {
         r.architecture = this.#p?.cpu?.architecture || 'x86';
       }
       if (hints.includes('bitness')) {
         r.bitness = '64';
       }
       if (hints.includes('model')) {
         r.model = '';
       }
       if (hints.includes('platformVersion')) {
         r.platformVersion = this.#p?.os?.version || '10.0.0';
       }
       if (hints.includes('uaFullVersion')) {
         r.uaFullVersion = this.brands[0].version;
       }
       if (hints.includes('fullVersionList')) {
         r.fullVersionList = this.brands;
       }
       return Promise.resolve(r);
     }
   }(o.userAgentDataBuilder);

   navigator.__defineGetter__('userAgentData', () => {
     return v;
   });
 }
 delete o.userAgentDataBuilder;
 for (const key of Object.keys(o)) {
   if (o[key] === '[delete]') {
     delete Object.getPrototypeOf(window.navigator)[key];
   }
   else {
     navigator.__defineGetter__(key, () => {
       if (o[key] === 'empty') {
         return '';
       }
       return o[key];
     });
   }
 }
}();