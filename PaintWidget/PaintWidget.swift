//
//  PaintWidget.swift
//  PaintWidget
//
//  Created by Alessandro Gallo on 01/04/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date() )
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date())]

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
     
     

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let paint = Image("quadro")
    
}

struct PaintWidgetEntryView : View {
    var entry: Provider.Entry
    var paint =  Paint(name: "", image: "quadro")
    
    var body: some View {
       

        ContentView(paint: Paint)
        
    }
}

@main
struct PaintWidget: Widget {
    let kind: String = "PaintWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            PaintWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Paint of the day Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall,.systemLarge])
    }
}

struct PaintWidget_Previews: PreviewProvider {
    static var previews: some View {
        PaintWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        PaintWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

