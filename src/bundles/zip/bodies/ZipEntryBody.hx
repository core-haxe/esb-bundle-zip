package bundles.zip.bodies;

import haxe.io.Bytes;
import esb.core.bodies.RawBody;

@:keep
@:keepInit
@:keepSub
@:expose
@:native("bundles.zip.bodies.ZipEntryBody")
class ZipEntryBody extends RawBody {
    public var name:String;
    public var extension:String;
    public var size:Int;
    public var data:Bytes;
    public var hash:String;

    public override function fromBytes(bytes:Bytes) {
        var unserializer = new haxe.Unserializer(bytes.toString());
        name = unserializer.unserialize();
        extension = unserializer.unserialize();
        size = unserializer.unserialize();
        data = unserializer.unserialize();
        hash = unserializer.unserialize();
    }

    public override function toBytes():Bytes {
        var serializer = new haxe.Serializer();
        serializer.serialize(name);
        serializer.serialize(extension);
        serializer.serialize(size);
        serializer.serialize(data);
        serializer.serialize(hash);
        var s = serializer.toString();
        return Bytes.ofString(s);
    }

}
