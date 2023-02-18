CKEDITOR.editorConfig = function (config) {
  config.extraPlugins = 'eqneditor,autosave,';

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "mini";

  // ... rest of the original config.js  ...
}