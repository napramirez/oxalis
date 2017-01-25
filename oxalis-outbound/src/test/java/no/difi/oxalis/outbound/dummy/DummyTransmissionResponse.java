/*
 * Copyright 2010-2017 Norwegian Agency for Public Management and eGovernment (Difi)
 *
 * Licensed under the EUPL, Version 1.1 or – as soon they
 * will be approved by the European Commission - subsequent
 * versions of the EUPL (the "Licence");
 *
 * You may not use this work except in compliance with the Licence.
 *
 * You may obtain a copy of the Licence at:
 *
 * https://joinup.ec.europa.eu/community/eupl/og_page/eupl
 *
 * Unless required by applicable law or agreed to in
 * writing, software distributed under the Licence is
 * distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied.
 * See the Licence for the specific language governing
 * permissions and limitations under the Licence.
 */

package no.difi.oxalis.outbound.dummy;

import eu.peppol.identifier.MessageId;
import no.difi.oxalis.api.outbound.TransmissionRequest;
import no.difi.oxalis.api.outbound.TransmissionResponse;
import no.difi.vefa.peppol.common.lang.PeppolException;
import no.difi.vefa.peppol.common.model.*;

import java.util.Collections;
import java.util.Date;
import java.util.List;

public class DummyTransmissionResponse implements TransmissionResponse {

    private TransmissionRequest transmissionRequest;

    public DummyTransmissionResponse(TransmissionRequest transmissionRequest) {
        this.transmissionRequest = transmissionRequest;
    }

    @Override
    public MessageId getMessageId() {
        return new MessageId();
    }

    @Override
    public Header getHeader() {
        return transmissionRequest.getHeader();
    }

    @Override
    public List<Receipt> getReceipts() {
        return Collections.emptyList();
    }

    @Override
    public Endpoint getEndpoint() {
        return transmissionRequest.getEndpoint();
    }

    @Override
    public Receipt primaryReceipt() {
        return Receipt.of(new byte[0]);
    }

    @Override
    public Digest getDigest() {
        return null;
    }

    @Override
    public TransportProtocol getTransportProtocol() {
        try {
            return TransportProtocol.of("DUMMY");
        } catch (PeppolException e) {
            throw new IllegalStateException(e.getMessage(), e);
        }
    }

    @Override
    public Date getTimestamp() {
        return new Date();
    }
}