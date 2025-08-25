// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Works with Turbo (Hotwire)
document.addEventListener("turbo:load", () => {
  const menuBtn  = document.getElementById("menu-btn");
  const closeBtn = document.getElementById("close-btn");
  const sidebar  = document.getElementById("sidebar");
  const overlay  = document.getElementById("overlay");

  const isDesktop = () => window.matchMedia("(min-width: 1024px)").matches;

  const openSidebar = () => {
    if (!sidebar) return;
    sidebar.classList.remove("-translate-x-full");
    overlay?.classList.add("opacity-100", "pointer-events-auto");
    document.body.classList.add("overflow-hidden"); // lock scroll on mobile
    menuBtn?.setAttribute("aria-expanded", "true");
    menuBtn?.classList.add("hidden"); // hide floating button while open
  };

  const closeSidebar = () => {
    if (!sidebar) return;
    // keep sidebar visible on desktop; only hide on mobile
    if (!isDesktop()) sidebar.classList.add("-translate-x-full");
    overlay?.classList.remove("opacity-100", "pointer-events-auto");
    document.body.classList.remove("overflow-hidden");
    menuBtn?.setAttribute("aria-expanded", "false");
    menuBtn?.classList.remove("hidden");
  };

  const toggleSidebar = () => {
    const isClosed = sidebar?.classList.contains("-translate-x-full");
    (isClosed ? openSidebar : closeSidebar)();
  };

  // Bind handlers (override to avoid duplicate bindings on Turbo nav)
  if (menuBtn)  menuBtn.onclick  = toggleSidebar;
  if (closeBtn) closeBtn.onclick = closeSidebar;
  if (overlay)  overlay.onclick  = closeSidebar;

  // Close with ESC
  document.onkeydown = (e) => {
    if (e.key === "Escape") closeSidebar();
  };

  // Close when a sidebar link is clicked on mobile
  sidebar?.querySelectorAll("a").forEach((a) => {
    a.onclick = () => { if (!isDesktop()) closeSidebar(); };
  });

  // Keep state sane across resizes
  const syncOnResize = () => {
    if (isDesktop()) {
      sidebar?.classList.remove("-translate-x-full");
      overlay?.classList.remove("opacity-100", "pointer-events-auto");
      document.body.classList.remove("overflow-hidden");
      menuBtn?.classList.add("hidden");    // desktop: button not needed
      menuBtn?.setAttribute("aria-expanded", "true");
    } else {
      sidebar?.classList.add("-translate-x-full");
      overlay?.classList.remove("opacity-100", "pointer-events-auto");
      document.body.classList.remove("overflow-hidden");
      menuBtn?.classList.remove("hidden"); // mobile: show button
      menuBtn?.setAttribute("aria-expanded", "false");
    }
  };
  window.onresize = syncOnResize;
  syncOnResize();
});
