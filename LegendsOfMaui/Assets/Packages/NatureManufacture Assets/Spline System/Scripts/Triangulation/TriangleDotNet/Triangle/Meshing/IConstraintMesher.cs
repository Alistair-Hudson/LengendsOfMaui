﻿using TriangleNet.Geometry;

namespace TriangleNet.Meshing
{
    /// <summary>
    ///     Interface for polygon triangulation.
    /// </summary>
    public interface IConstraintMesher
    {
        /// <summary>
        ///     Triangulates a polygon.
        /// </summary>
        /// <param name="polygon">The polygon.</param>
        /// <returns>Mesh</returns>
        IMesh Triangulate(IPolygon polygon);

        /// <summary>
        ///     Triangulates a polygon, applying constraint options.
        /// </summary>
        /// <param name="polygon">The polygon.</param>
        /// <param name="options">Constraint options.</param>
        /// <returns>Mesh</returns>
        IMesh Triangulate(IPolygon polygon, ConstraintOptions options);
    }
}