require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import 'select2/dist/css/select2.css';

import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { multipleSelect } from '../plugins/select.js';

document.addEventListener('turbolinks:load', () => {
  initUpdateNavbarOnScroll();
});

multipleSelect();
