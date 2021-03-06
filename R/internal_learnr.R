#' Custom run_tutorial function adapted from learnr to accept and pass render_args.
#'
#' @param name 
#' @param package 
#' @param shiny_args 
#' @param render_args 
#'
#' @return
run_tut <- function (name = NULL, package = NULL, shiny_args = list(), render_args = NULL) {
  on.exit({
    if ("tools:UCLAstats20" %in% search()) {
      detach("tools:UCLAstats20")
    }
    })
  # removed code to install tutorial dependencies
  # (for UCLAstats20 all dependencies should be in Imports)
  tutorial_path <- system.file("tutorials", name, package = package)
  withr::with_dir(tutorial_path, {
    withr::local_envvar(c(RMARKDOWN_RUN_PRERENDER = "0"))
    rmarkdown::run(file = NULL,
                   dir = tutorial_path,
                   shiny_args = shiny_args,
                   render_args = render_args)
  })
}