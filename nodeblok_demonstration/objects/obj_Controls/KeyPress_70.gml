/// @description Fullscreen
// Allows you to switch between full and partial screen modes
if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
else
      {
      window_set_fullscreen(true);
      }