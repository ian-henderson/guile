#include <libguile.h>
#include <stdlib.h>

static SCM
current_desktop(void)
{
  char* s = getenv("XDG_CURRENT_DESKTOP");

  if (s == NULL)
    return SCM_BOOL_F;

  return scm_from_locale_string(s);
}

static void
inner_main(void* data, int argc, char** argv)
{
  scm_c_define_gsubr("current-desktop", 0, 0, 0, current_desktop);
  scm_shell(argc, argv);
}

int
main(int argc, char** argv)
{
  scm_boot_guile(argc, argv, inner_main, 0);
  return 0; /* Never reached */
}
