/*
 * Sonatype Nexus (TM) Open Source Version
 * Copyright (c) 2019-present Sonatype, Inc.
 * All rights reserved. Includes the third-party code listed at http://links.sonatype.com/products/nexus/oss/attributions.
 *
 * This program and the accompanying materials are made available under the terms of the Eclipse Public License Version 1.0,
 * which accompanies this distribution and is available at http://www.eclipse.org/legal/epl-v10.html.
 *
 * Sonatype Nexus (TM) Professional Version is available from Sonatype, Inc. "Sonatype" and "Sonatype Nexus" are trademarks
 * of Sonatype, Inc. Apache Maven is a trademark of the Apache Software Foundation. M2eclipse is a trademark of the
 * Eclipse Foundation. All other trademarks are the property of their respective owners.
 */
package org.sonatype.nexus.blobstore.azure.internal;

import java.io.IOException;
import java.util.Map;

import org.sonatype.nexus.blobstore.BlobAttributesSupport;
import org.sonatype.nexus.blobstore.api.BlobMetrics;

public class AzureBlobAttributes
    extends BlobAttributesSupport<AzurePropertiesFile>
{

  public AzureBlobAttributes(final AzureClient azureClient, final String key) {
    super(new AzurePropertiesFile(azureClient, key), null, null);
  }

  public AzureBlobAttributes(final AzureClient azureClient, final String key, final Map<String, String> headers,
                             final BlobMetrics metrics) {
    super(new AzurePropertiesFile(azureClient, key), headers, metrics);
  }

  public boolean load() throws IOException {
    if (!propertiesFile.exists()) {
      return false;
    }
    propertiesFile.load();
    readFrom(propertiesFile);
    return true;
  }

  public void store() throws IOException {
    writeTo(propertiesFile);
    propertiesFile.store();
  }
}
