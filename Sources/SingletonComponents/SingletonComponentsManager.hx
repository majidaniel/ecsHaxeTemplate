package singletonComponents;

//To use, init your singleton component in new(), and add a convenience enum to this enum
//TODO: learn macros so this is better
enum abstract SingleComponentType(String) {
    var Camera;
}

class SingletonComponentsManager{
    public static final instance:SingletonComponentsManager = new SingletonComponentsManager();

    private final singletons:Map<SingleComponentType, Dynamic> = new Map();

    public function new(){
        var camera:Camera = {x:0, y:0, zoom:1};
        singletons.set(SingleComponentType.Camera,camera);
    }

    public function get(singletonType:SingleComponentType){
        
        return singletons.get(singletonType);
    }
}