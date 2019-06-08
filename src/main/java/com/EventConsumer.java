package com;

import io.micronaut.discovery.event.ServiceStartedEvent;
import io.micronaut.runtime.event.annotation.EventListener;

import javax.inject.Singleton;

@Singleton
public class EventConsumer {

    @EventListener
    void onStartup(ServiceStartedEvent event) {
        System.out.println("yes");
    }
}
