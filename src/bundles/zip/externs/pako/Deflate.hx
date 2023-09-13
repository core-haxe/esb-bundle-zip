package bundles.zip.externs.pako;

import js.lib.Uint8Array;
import js.lib.ArrayBuffer;

@:jsRequire("pako", "Deflate")
extern class Deflate {
    public var result:Uint8Array;
    public var err:Int;
    public var msg:String;

    public function new(?options:Dynamic);
    public function push(data:ArrayBuffer, ?flush_mode:Bool):Bool;
}