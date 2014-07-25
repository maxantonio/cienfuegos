CKEDITOR.editorConfig = function( config ) {
  config.language = 'en';

  config.toolbarGroups = [
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
    '/',
    { name: 'styles' },
    { name: 'colors' },
    { name: 'editing',     groups: [ 'selection'] },
    { name: 'links' },
    { name: 'tools' },
    { name: 'others' }
];
};
