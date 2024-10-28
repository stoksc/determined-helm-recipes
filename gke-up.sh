#!/usr/bin/env bash

gcloud beta container --project "determined-ai" clusters create "bradley" --region "us-east4" \
    --no-enable-basic-auth --cluster-version "1.30.5-gke.1014001" --release-channel "regular" \
    --machine-type "e2-small" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" \
    --metadata disable-legacy-endpoints=true \
    --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
    --num-nodes "1" --logging=SYSTEM,WORKLOAD \
    --monitoring=SYSTEM,STORAGE,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,CADVISOR,KUBELET \
    --enable-ip-alias --network "projects/determined-ai/global/networks/default" \
    --subnetwork "projects/determined-ai/regions/us-east4/subnetworks/default" --no-enable-intra-node-visibility \
    --default-max-pods-per-node "110" \
    --location-policy "BALANCED" --security-posture=standard \
    --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks \
    --no-enable-google-cloud-access --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver \
    --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 \
    --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --enable-shielded-nodes \
    --labels owner=bradley_laney,gh_team=no_team
