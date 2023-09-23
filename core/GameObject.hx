package core;

import hxd.res.Image;
import core.AnimCore;
import h2d.col.Bounds;
import h2d.Object;
import h2d.Scene;

class GameObject extends Object {
    public var scene: Scene;
    public var sprite: Object;
    public var hitbox: Bounds;

    public function new(scene: Scene) {
        super(scene);
        
        this.scene = scene;
    }

    function get_hitbox() {
        hitbox.x = this.x;
        hitbox.y = this.y;
        return hitbox;
    }

    function set_sprite(obj: Object){
        sprite = obj;
        sprite.parent = this;

        return sprite;
    }

    public function useAnimationFromSpriteStrip(image_resource: Image, speed, chosenFrames: Array<Int>, centered: Bool = true) {
        var oldsprite = sprite;
        sprite = AnimCore.createAnimFromStrip( this, image_resource, speed, chosenFrames, centered);
        oldsprite.remove();

        return sprite;
    }
}
