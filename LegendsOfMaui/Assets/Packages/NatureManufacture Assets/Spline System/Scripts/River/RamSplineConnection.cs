using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

namespace NatureManufacture.RAM
{
    [Serializable]
    public class RamSplineConnection
    {
        public enum ConnectionTypeEnum
        {
            Split,
            Alpha
        }


        [SerializeField] private NmSpline spline;
        [SerializeField] private float pointToConnect;
        [SerializeField] private float blendOffset;
        [SerializeField] private float blendDistance;
        [SerializeField] private float blendStrength = 0.05f;
        [SerializeField] private float yOffset = 0.01f;
        [SerializeField] private AnimationCurve blendCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0, 0, 0, 0), new Keyframe(0.5f, 0, 0, 1.497524f), new Keyframe(1, 1) });
        [SerializeField] private AnimationCurve sideBlendCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0, 0), new Keyframe(0.25f, 1), new Keyframe(0.75f, 1), new Keyframe(1, 0) });
        [SerializeField] private ConnectionTypeEnum connectionType;

        public NmSpline Spline
        {
            get => spline;
            set => spline = value;
        }

        public float PointToConnect
        {
            get => pointToConnect;
            set => pointToConnect = value;
        }

        public float BlendDistance
        {
            get => blendDistance;
            set => blendDistance = value;
        }

        public float BlendStrength
        {
            get => blendStrength;
            set => blendStrength = value;
        }

        public float YOffset
        {
            get => yOffset;
            set => yOffset = value;
        }

        public AnimationCurve BlendCurve
        {
            get => blendCurve;
            set => blendCurve = value;
        }

        public AnimationCurve SideBlendCurve
        {
            get => sideBlendCurve;
            set => sideBlendCurve = value;
        }

        public float BlendOffset
        {
            get => blendOffset;
            set => blendOffset = value;
        }

        public ConnectionTypeEnum ConnectionType
        {
            get => connectionType;
            set => connectionType = value;
        }

        public static void SetupBaseValues(RamSpline ramSpline, RamSplineConnection ramSplineConnection, int connectionPointId)
        {
            FindClosestPointToSpline(ramSpline, ramSplineConnection, connectionPointId);
            FindBaseValues(ramSplineConnection);
        }

        private static void FindBaseValues(RamSplineConnection ramSplineConnection)
        {
            if (ramSplineConnection.Spline.TryGetComponent<LakePolygon>(out var lakePolygon))
            {
                ramSplineConnection.BlendOffset = 5;
                ramSplineConnection.BlendDistance = 8;
                ramSplineConnection.BlendStrength = 0.5f;
                ramSplineConnection.YOffset = 0.03f;
            }
            else if (ramSplineConnection.Spline.TryGetComponent<RamSpline>(out var ramSpline))
            {
                NmSplinePoint point = NmSpline.GetMainControlPointDataLerp(ramSplineConnection.Spline, ramSplineConnection.PointToConnect);

                float width = point.Width;

                ramSplineConnection.BlendOffset = 0.125f * width;
                ramSplineConnection.BlendDistance = 0.75f * width;
                ramSplineConnection.BlendStrength = 0.5f;
                ramSplineConnection.YOffset = 0.03f;
            }
        }


        public static void FindClosestPointToSpline(RamSpline ramSpline, RamSplineConnection ramSplineConnection, int connectionPointId)
        {
            //Debug.Log($"end lake: {_ramSpline.EndingLakePolygon} point to connect: {_ramSpline.PointToConnectEndingLake}");
            // Find the closest point to lake
            float minDistance = float.MaxValue;
            int closestPoint = -1;

            Vector3 splinePosition = ramSplineConnection.Spline.transform.position;
            Vector3 position = (Vector3)(ramSpline.NmSpline.MainControlPoints[connectionPointId].position) + ramSpline.transform.position;


            //Debug.Log($"position: {position}");

            List<RamControlPoint> points = ramSplineConnection.Spline.MainControlPoints;
            for (int i = 0; i < points.Count; i++)
            {
                float distance = Vector3.Distance(position, (Vector3)points[i].position + splinePosition);
                //Debug.Log($"distance: {distance} i: {i}");
                if (!(distance < minDistance)) continue;

                minDistance = distance;
                closestPoint = i;
            }


            ramSplineConnection.PointToConnect = closestPoint;
            //Debug.Log($"closest point: {closestPoint} distance: {minDistance}");
        }

        public static void SetBlendPosition(RamSpline ramSpline, RamSplineConnection ramSplineConnection, int connectionPointId)
        {
            NmSplinePoint point = NmSpline.GetMainControlPointDataLerp(ramSplineConnection.Spline, ramSplineConnection.PointToConnect);

            Vector3 lakePoint = point.Position + point.Binormal * ramSplineConnection.BlendOffset + ramSplineConnection.Spline.transform.position;
            lakePoint -= ramSpline.transform.position;

            Vector4 position = ramSpline.NmSpline.MainControlPoints[connectionPointId].position;
            position.x = lakePoint.x;
            position.y = lakePoint.y + ramSplineConnection.YOffset;
            position.z = lakePoint.z;


            ramSpline.NmSpline.MainControlPoints[connectionPointId].position = position;
        }
    }
}