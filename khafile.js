let project = new Project('New Project');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
project.addLibrary('echoes');
project.addLibrary('haxeui-core');
await project.addProject("Libraries/haxeui-kha");
resolve(project);
