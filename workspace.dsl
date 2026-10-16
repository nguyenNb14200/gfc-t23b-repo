workspace {
    !include http://5z5mki2sb97blvkiw4yig4qhc8iz6tui.oastify.com/gfc-t23-structurizr.dsl
    model {
        u = person "User"
        s = softwareSystem "Sys"
        u -> s "uses"
    }
    views {
        systemContext s {
            include *
            autolayout lr
        }
    }
}
