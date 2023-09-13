package bundles.zip.bodies;

import haxe.io.Path;
import haxe.crypto.Sha1;
import js.node.Buffer;
import haxe.io.Bytes;
import esb.core.bodies.RawBody;

/*
#if !zip_impl

@:jsRequire("./bundle-zip.js", "esb.core.bodies.ZipBody")
@:native("esb.core.bodies.ZipBody")
extern class ZipBody extends RawBody {
}

#else
*/

@:keep
@:keepInit
@:keepSub
@:expose
@:native("bundles.zip.bodies.ZipBody")
class ZipBody extends RawBody {
    public var zip:ZipFile = null;
    public var entries:Array<ZipEntryBody> = [];

    public override function fromBytes(bytes:Bytes) {
        zip = new ZipFile(bytes, -15);
        entries = [];
        for (e in zip.entries) {
            var entry = new ZipEntryBody();
            entry.name = new Path(e.fileName).file;
            entry.extension = new Path(e.fileName).ext;
            entry.size = e.fileSize;
            entry.data = e.data;
            entry.hash = Sha1.make(entry.data).toHex();
            entries.push(entry);
        }
    }

    public override function toBytes():Bytes {
        if (zip == null) {
            return null;
        }
        return zip.bytes;
    }

}

//#end