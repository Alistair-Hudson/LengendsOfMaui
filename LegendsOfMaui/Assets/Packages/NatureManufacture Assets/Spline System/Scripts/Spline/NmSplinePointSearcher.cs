// /**
//  * Created by Pawel Homenko on  05/2023
//  */

using System.Collections.Generic;
using UnityEngine;

namespace NatureManufacture.RAM
{
    public class NmSplinePointSearcher
    {
        private readonly NmSpline _nmSpline;

        public NmSplinePointSearcher(NmSpline nmSpline)
        {
            _nmSpline = nmSpline;
        }

        private NmSplinePoint[] PointsArray { get; set; }

        private Dictionary<float, NmSplinePoint> Positions { get; } = new();

        public NmSplinePoint FindPosition(float lengthToFind, int searchFrom, out int lastID)
        {
            if (PointsArray == null || PointsArray.Length == 0)
            {
                Debug.LogError("No points in array to search. Use GenerateArrayForDistanceSearch to generate array");
                lastID = 0;
                return new NmSplinePoint();
            }


            if (_nmSpline.IsLooping) lengthToFind %= _nmSpline.Length;


            if (Positions.TryGetValue(lengthToFind, out NmSplinePoint newSplinePoint))
            {
                //Debug.Log($"dict found");
                lastID = newSplinePoint.ID;
                return newSplinePoint;
            }

            newSplinePoint = new NmSplinePoint();


            int index = BinarySearch(PointsArray, lengthToFind);
            if (index != -1)
            {
                newSplinePoint = FindNewSplinePoint(lengthToFind, index);

                newSplinePoint.ID = index;
                lastID = index;
                return newSplinePoint;
            }


            switch (_nmSpline.IsLooping)
            {
                case false when lengthToFind <= 0:

                    newSplinePoint = FindNewSplinePoint(lengthToFind, 0);
                    lastID = -1;
                    return newSplinePoint;

                case false when lengthToFind >= _nmSpline.Length:

                    newSplinePoint = FindNewSplinePoint(lengthToFind, PointsArray.Length - 2);
                    lastID = -2;
                    return newSplinePoint;

                case true:

                    NmSplinePoint lastPoint = PointsArray[^1];
                    NmSplinePoint splinePoint = PointsArray[^2];
                    NmSplinePoint splinePointFirst = PointsArray[0];

                    float lerpValue = GetLastLerpValue(lengthToFind, splinePoint, lastPoint);

                    newSplinePoint = GetNewSplinePoint(lengthToFind, splinePointFirst, splinePoint, lerpValue);
                    
                    AdditionalDataNewPosition(lengthToFind, lerpValue, 0, PointsArray.Length - 1);

                    lastID = -3;
                    return newSplinePoint;

                default:
                    lastID = -4;
                    return newSplinePoint;
            }
        }

        private void AdditionalDataNewPosition(float lengthToFind, float lerpValue,  int firstIndex, int secondIndex)
        {
            foreach (NmSplineDataBase additionalData in _nmSpline.AdditionalDataList)
            {
                additionalData.AddSearchData(lengthToFind, lerpValue,  firstIndex, secondIndex);
            }
        }

        private NmSplinePoint FindNewSplinePoint(float lengthToFind, int index)
        {
            NmSplinePoint splinePointFirst = PointsArray[index];
            NmSplinePoint splinePoint = PointsArray[index + 1];

            float lerpValue = GetLerpValue(lengthToFind, splinePoint, splinePointFirst);

            NmSplinePoint newSplinePoint = GetNewSplinePoint(lengthToFind, splinePointFirst, splinePoint, lerpValue);
            AdditionalDataNewPosition(lengthToFind, lerpValue, index, index + 1);
          
            
            return newSplinePoint;
        }

        private NmSplinePoint GetNewSplinePoint(float lengthToFind, NmSplinePoint splinePointFirst, NmSplinePoint splinePoint, float lerpValue)
        {
            NmSplinePoint newSplinePoint = InterpolateSplinePointProperties(splinePointFirst, splinePoint, lerpValue);
            newSplinePoint.Position += _nmSpline.transform.position;

            if (_nmSpline.IsSnapping)
                SnapPoint(newSplinePoint);

            Positions.Add(lengthToFind, newSplinePoint);
            return newSplinePoint;
        }

        private static int BinarySearch(NmSplinePoint[] pointsArray, float lengthToFind)
        {
            int low = 0;
            int high = pointsArray.Length - 1;
            while (low <= high)
            {
                int mid = low + (high - low) / 2;
                // Debug.Log($" mid {mid} low {low} high {high} ");
                if (mid < pointsArray.Length - 1 && pointsArray[mid].Distance <= lengthToFind && pointsArray[mid + 1].Distance > lengthToFind)
                    //Debug.Log($"Found {mid}");
                    return mid;


                //if (mid < pointsArray.Length - 1)
                //    Debug.Log($"lengthToFind {lengthToFind} pointsArray[mid].Distance {pointsArray[mid].Distance} pointsArray[mid + 1].Distance {pointsArray[mid + 1].Distance}");

                if (pointsArray[mid].Distance > lengthToFind)
                    high = mid - 1;
                else
                    low = mid + 1;
            }

            // return -1 or any appropriate value when not found
            return -1;
        }

        private static void SnapPoint(NmSplinePoint newSplinePoint)
        {
            if (Physics.Raycast(newSplinePoint.Position + Vector3.up * 1000, Vector3.down, out RaycastHit raycastHit)) newSplinePoint.Position = raycastHit.point;
        }

        private float GetLastLerpValue(float lengthToFind, NmSplinePoint splinePoint, NmSplinePoint lastPoint)
        {
            float distance = _nmSpline.Length - splinePoint.Distance;
            float distanceBasePoint = lastPoint.Distance + lengthToFind - splinePoint.Distance;
            float lerpValue = distanceBasePoint / distance;
            return lerpValue;
        }

        private static float GetLerpValue(float lengthToFind, NmSplinePoint splinePoint, NmSplinePoint splinePointFirst)
        {
            float distance = splinePoint.Distance - splinePointFirst.Distance;
            float distanceBasePoint = lengthToFind - splinePointFirst.Distance;
            float lerpValue = distanceBasePoint / distance;
            return lerpValue;
        }

        private static NmSplinePoint InterpolateSplinePointProperties(NmSplinePoint pointFirst, NmSplinePoint pointSecond, float lerpValue)
        {
            var newSplinePoint = new NmSplinePoint
            {
                Position = Vector3.Lerp(pointFirst.Position, pointSecond.Position, lerpValue),
                Width = Mathf.Lerp(pointFirst.Width, pointSecond.Width, lerpValue),
                Tangent = Vector3.Lerp(pointFirst.Tangent, pointSecond.Tangent, lerpValue),
                Normal = Vector3.Lerp(pointFirst.Normal, pointSecond.Normal, lerpValue),
                Binormal = Vector3.Lerp(pointFirst.Binormal, pointSecond.Binormal, lerpValue),
                Orientation = Quaternion.Slerp(pointFirst.Orientation, pointSecond.Orientation, lerpValue),
                Rotation = Quaternion.Slerp(pointFirst.Rotation, pointSecond.Rotation, lerpValue)
            };

            return newSplinePoint;
        }

        public void ClearPositions()
        {
            Positions.Clear();
        }


        public void GenerateArrayForDistanceSearch(List<NmSplinePoint> points)
        {
            PointsArray = points.ToArray();
        }
    }
}