cfg = get_config()

# Enable nbgrader
cfg.NotebookApp.nbserver_extensions = {
    'nbgrader.server_extensions.formgrader': True,
}

# Course root directory (can be the same as /home/jovyan/nbgrader)
cfg.CourseDirectory.root = '/home/jovyan/nbgrader'

# Autograde settings
cfg.Exchange.root = '/home/jovyan/exchange'
cfg.IncludeHeaderFooter.header = "source/header.ipynb"
cfg.IncludeHeaderFooter.footer = "source/footer.ipynb"