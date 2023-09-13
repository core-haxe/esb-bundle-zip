package bundles.zip;

import esb.core.Bus.*;
import esb.core.Message;
import esb.logging.Logger;

@:expose("bundles.zip.Bundle")
class Bundle extends esb.core.Bundle {
    private static var log:Logger = new Logger("bundles.zip.Bundle");

    public override function start() {
        super.start();

        log.info("starting zip bundle");

        registerMessageType(bundles.zip.bodies.ZipBody, () -> {
            var m = @:privateAccess new Message<bundles.zip.bodies.ZipBody>();
            m.body = new bundles.zip.bodies.ZipBody();
            return cast m;
        });

        registerMessageType(bundles.zip.bodies.ZipEntryBody, () -> {
            var m = @:privateAccess new Message<bundles.zip.bodies.ZipEntryBody>();
            m.body = new bundles.zip.bodies.ZipEntryBody();
            return cast m;
        });
    }
}